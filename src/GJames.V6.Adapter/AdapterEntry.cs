using GJames.Engine.Core;

namespace GJames.V6.Adapter
{
    public class AdapterEntry
    {
        public string Run()
        {
            EngineCoordinator coordinator = new EngineCoordinator();
            string result = coordinator.DescribeEngine();
            return result;
        }
    }
}
