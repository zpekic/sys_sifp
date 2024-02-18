using System;

namespace TinyBas
{
    internal class TBException : Exception
    {
        private int line;
        private string customMessage;

        public TBException(int lineNumber, string message) : base(message)
        {
            this.line = lineNumber;
            this.customMessage = message;
        }

        public override string Message
        {
            get
            {
                return $"Error in line {line}: {customMessage}.";
            }
        }
    }
}
