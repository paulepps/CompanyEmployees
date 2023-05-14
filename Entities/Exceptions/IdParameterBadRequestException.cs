namespace Entities.Exceptions
{
    public sealed class IdParameterBadRequestException : BadRequestException
    {
        public IdParameterBadRequestException()
            : base("Parameter ids is null")
        {
        }
    }
}
