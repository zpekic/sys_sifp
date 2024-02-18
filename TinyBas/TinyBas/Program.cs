using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TinyBas
{
    // http://www.ittybittycomputers.com/IttyBitty/TinyBasic/index.htm

    class Program
    {
        static Memory m;
        static TinyBasic tb;


        static void Main(string[] args)
        {
            ushort loIL, hiIL;

            m = new Memory();
            loIL = 0x0800;
            hiIL = m.LoadIL(loIL, args.Length > 1 ? new System.IO.FileInfo(args[1]) : null);       // IL starts at 2k boundary in ROM
            //m[DECAPS] = m.Decaps(0x0F00);         // Decaps look-up in last 256 words in ROM
            // find RAM bottom
            //m[LOWUSER] = GetRamBottom();
            //m[HIUSER] = 0xFDFF;

            tb = new TinyBasic(m, 0xF800, 0xFDFF, loIL, hiIL, 0xFE00);
            tb.Load(args.Length > 0 ? new System.IO.FileInfo(args[0]) : null);
            tb.Run();

        }

        static void MemFill(ushort start, ushort end, ushort value)
        {
            for (ushort address = start; address <= end; address++)
            {
                m[address] = value;
            }
        }

        static ushort GetRamBottom()
        {
            for (ushort address = 0xFFFF; address >= 0; address--)
            {
                ushort original = m[address];
                ushort flipped = (ushort)(original ^ 0xFFFF);
                m[address] = flipped;
                if (m[address] == flipped)
                {
                    m[address] = original;
                }
                else
                {
                    return (ushort)(address + 1);
                }
            }

            return 0;
        }

        internal static void Print(string s)
        {
            foreach(char c in s)
            {
                m[0x2001] = (ushort)c;
            }
        }

        internal static void PrintLine(string s)
        {
            Print(s);
            m[0x2001] = 0x000D;
            m[0x2001] = 0x000A;
        }

        internal static void Assert(bool condition, string exceptionMessage)
        {
            if (!condition)
            {
                throw new TBException(0, exceptionMessage);
            }
        }
    }
}
