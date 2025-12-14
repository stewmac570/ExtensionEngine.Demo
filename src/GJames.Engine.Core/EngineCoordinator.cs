using GJames.Engine.Contracts;

namespace GJames.Engine.Core
{
    public class EngineCoordinator
    {
        public string DescribeEngine()
        {
            EngineInfo info = new EngineInfo();
            return $"{info.Name} v{info.Version}";
        }
    }
}
