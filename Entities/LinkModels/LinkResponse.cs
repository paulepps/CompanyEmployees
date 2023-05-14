using Entities.Models;

namespace Entities.LinkParameters
{
    public class LinkResponse
    {
        public bool HasLinks { get; set; }
        public List<Entity> ShapedEntities { get; set; }
        public LinkCollectionWrapper<Entity> LinkedEntities { get; set; }

        public LinkResponse() 
        { 
            LinkedEntities = new LinkCollectionWrapper<Entity>();
            ShapedEntities = new List<Entity>();
        }
    }
}
