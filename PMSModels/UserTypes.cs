using System;

namespace PMSModels
{
    public class UserTypes
    {
        public Guid UserTypeId { get; set; }
        public string UserType { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? LastModifiedDate { get; set; }
        public Guid? LastModifiedBy { get; set; }
    }
}
