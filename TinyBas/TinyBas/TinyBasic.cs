using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace TinyBas
{
    class TinyBasic
    {
        private Memory M;

        private ushort LoUser;
        private ushort HiUser;
        private ushort LoILCode;
        private ushort HiILCode;
        private ushort WorkspaceBase;
        private ushort ILOperation;
        private ushort ILPC;
        private ushort ExpnStk;
        private ushort ExpnTop;
        private ushort InLEnd;  // input line end


        public TinyBasic(Memory m, ushort loUser, ushort hiUser, ushort loILCode, ushort hiILCode, ushort workspaceBase)
        {
            this.M = m;
            this.LoUser = loUser;
            this.HiUser = hiUser;
            this.LoILCode = loILCode;
            this.HiILCode = hiILCode;
            this.WorkspaceBase = workspaceBase;

            Program.PrintLine($"TINY BASIC - Copyright, Tom Pitman");
            Program.PrintLine($"{hiUser - loUser} WORDS FREE");
            Program.PrintLine($"IL AT {loILCode:X4}..{hiILCode:X4}");
        }

        public void Load(FileInfo tbProgramFile)
        {
            if (tbProgramFile != null)
            {
                // TODO: load .bas file into memory 
            }
        }

        public void Run()
        {
            bool runBasic = true;
            ILPC = LoILCode;

            while (runBasic)
            {
                ILOperation = M[ILPC];
                M.TraceILCode(ILPC);
                ILPC++;
                switch ((ILOperation >> 5) & 0x0007)    // 8 blocks of 32 IL op-codes each
                {
                    case 0:     // 00..1F
                        il_opr0();
                        break;
                    case 1:     // 20..3F
                        il_opr1();
                        break;
                    case 2:     // 40..5F
                        il_bbr();   // Backward branch relative
                        break;
                    case 3:     // 60..7F
                        il_fbr();   // Forward branch relative
                        break;
                    case 4:     // 80..9F
                        il_bc();    // 
                        break;
                    case 5:     // A0..BF
                        il_bv();    // Branch if not variable
                        break;
                    case 6:     // C0..DF
                        il_bn();    // Branch if not a number
                        break;
                    default:    // E0..FF
                        il_be();    // Branch if not end of line
                        break;
                }
            }
        }

        private void il_opr0()
        {
            ushort ix, op;

            switch (ILOperation)
            {
                case 0x0000:    // SX 0 == NOP
                    break;
                case 0x0001:
                case 0x0002:
                case 0x0003:
                case 0x0004:
                case 0x0005:
                case 0x0006:
                case 0x0007:
                    /* SX n    00-07   Stack Exchange. */
                    /*                 Exchange the top byte of computational stack with  */
                    /* that "n" bytes into the stack. The top/left byte of the stack is   */
                    /* considered to be byte 0, so SX 0 does nothing.                     */
                    ix = (ushort) (ILOperation / 2);
                    if ((ExpnTop + ix) >= ExpnStk)
                    {       
                        /* swap is below stack depth */
                        TBerror();
                        return;
                    }
                    ushort byte0Lo = (ushort)(M[ExpnTop] & 0x00FF);
                    ushort byte0Hi = (ushort)(M[ExpnTop] & 0xFF00);
                    ushort byteXLo = (ushort)(M[(ushort)(ExpnTop + ix)] & 0x00FF);
                    ushort byteXHi = (ushort)(M[(ushort)(ExpnTop + ix)] & 0xFF00);
                    if ((ILOperation % 2) == 0)
                    {
                        // 2, 4, 6
                        M[(ushort)(ExpnTop + ix)] = (ushort)(byte0Hi | byteXLo);
                        M[ExpnTop] = (ushort)(byteXHi | byte0Lo);
                    }
                    else
                    {   
                        // 1, 3, 5, 7
                        M[(ushort)(ExpnTop + ix)] = (ushort)(byteXHi | byte0Lo);
                        M[ExpnTop] = (ushort)((byteXLo << 8) | byte0Lo);
                    }
                    break;
                case 0x0008:    // NOP
                    break;
                case 0x0009:
                case 0x000A:
                case 0x000B:
                case 0x000C:
                case 0x0010:
                case 0x0011:
                case 0x0012:
                case 0x0013:
                case 0x0014:
                case 0x0015:
                case 0x0016:
                    break;
                /* NE      17      Negate (two's complement).                         */
                /*                 The number in the top two bytes of the expression  */
                /* stack is replaced with its negative.                               */
                case 0x0017:
                    ix = PopExInt();
                    if (ILPC != 0) PushExInt((ushort) -ix);
                    break;

                /* AD      18      Add.                                               */
                /*                 Add the two numbers represented by the top four    */
                /* bytes of the expression stack, and replace them with the two-byte  */
                /* sum. Stack underflow results in an error stop.                     */
                case 0x0018:
                    ix = PopExInt();
                    op = PopExInt();
                    if (ILPC != 0) PushExInt((ushort) (op + ix));
                    break;

                /* SU      19      Subtract.                                          */
                /*                 Subtract the two-byte number on the top of the     */
                /* expression stack from the next two bytes and replace the 4 bytes   */
                /* with the two-byte difference.                                      */
                case 0x0019:
                    ix = PopExInt();
                    op = PopExInt();
                    if (ILPC != 0) PushExInt((ushort) (op - ix));
                    break;

                /* MP      1A      Multiply.                                          */
                /*                 Multiply the two numbers represented by the top 4  */
                /* bytes of the computational stack, and replace them with the least  */
                /* significant 16 bits of the product. Stack underflow is possible.   */
                case 0x001A:
                    ix = PopExInt();
                    op = PopExInt();
                    if (ILPC != 0) PushExInt((ushort) (op * ix));
                    break;

                /* DV      1B      Divide.                                            */
                /*                 Divide the number represented by the top two bytes */
                /* of the computational stack into that represented by the next two.  */
                /* Replace the 4 bytes with the quotient and discard the remainder.   */
                /* This is a signed (two's complement) integer divide, resulting in a */
                /* signed integer quotient. Stack underflow or attempted division by  */
                /* zero result in an error stop. */
                case 0x001B:
                    ix = PopExInt();
                    op = PopExInt();
                    if (ix == 0)
                    {
                        TBerror();                      /* divide by 0.. */
                    }
                    else
                    {
                        if (ILPC != 0) PushExInt((ushort) (op / ix));
                    }
                    break;
                case 0x001C:
                case 0x001D:
                case 0x001E:
                case 0x001F:
                    break;
                default:
                    Program.Assert(false, $"Undefined or reserved IL code {ILOperation} at {ILPC:X4}");
                    break;
            }
        }

        void PushExInt(ushort value)
        {      /* push integer onto expression stack */
            ExpnTop -= 1;
            if (ExpnTop < InLEnd)
            {
                TBerror();  /* overflow: bumped into input line */
            }
            else
            {
                M[ExpnTop] = value;
            }
            //if (Debugging > 0) ShowExSt();
        } /* ~PushExInt */

        ushort PopExInt()
        {              /* pop integer off expression stack */
            if (++ExpnTop < ExpnStk) return (int)((short)Peek2((ExpnTop++) - 1));
            TBerror();    /* underflow (nothing in stack) */
            return -1;
        } /* ~PopExInt */

        private void TBerror()
        {
            throw new NotImplementedException();
        }

        void il_opr1()
        {
            if (ILOperation < 0x0030)
            {
                // branch or jump
            }
            else
            {

            }
        }

        void il_bbr()
        {

        }

        void il_fbr()
        {

        }
        static void il_bc()
        {

        }
        static void il_bv()
        {

        }
        static void il_bn()
        {

        }
        static void il_be()
        {

        }

/*
        static void WarmStart()
        {                 //initialize existing program
            UserEnd = Peek2(EndUser);
            SubStk = UserEnd;            // empty subroutine, expression stacks 
            Poke2(GoStkTop, SubStk);
            ExpnTop = ExpnStk;
            Lino = 0;                                      // not in any line
            ILPC = 0;                                      // start IL at front
            SvPt = InLine;
            BP = InLine;
            Core[BP] = 0;
            Core[TabHere] = 0;
            InLend = InLine;
        }

        static void ColdStart()
        {                 // initialize program to empty 
            if (Peek2(ILfront) != ILfront + 2)
            {
                ILend = Peek2(ILfront) + 0x800;
            }
            Poke2(UserProg, (ILend + 255) & -256);   // start Basic shortly after IL 
            if (CoreTop > 65535)
            {
                Poke2(EndUser, 65534);
                Poke2(65534, 0xDEAD);
            }
            else
            {
                Poke2(EndUser, CoreTop);
            }
            WarmStart();
            SrcEnd = Peek2(UserProg);
            Poke2(SrcEnd++, 0);
            Poke2(EndProg, ++SrcEnd);
        }

        static void Poke2(UInt16 address, UInt16 value)
        {
            M[address] = value;
        }

        static UInt16 Peek2(UInt16 address)
        {
            return M[address];
        }
    */
    }

 }
