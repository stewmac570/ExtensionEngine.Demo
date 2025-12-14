using System;

namespace GJames.Engine.Infrastructure
{
    public class EngineLogger
    {
        public void Log(string message)
        {
            // Demo only — no file writes.
            Console.WriteLine("[LOG] " + message);
        }
    }
}
