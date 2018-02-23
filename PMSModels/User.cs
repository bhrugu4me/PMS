using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PMSModels
{
    public class User
    {
        public Guid UserId { get; set; }
        public string EmailId { get; set; }
        public string Password { get; set; }
        public DateTime? LastLogin { get; set; }
        public bool? IsActive { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? LastModifiedBy { get; set; }
        public DateTime? LastModifiedDate { get; set; }
    }

    public class UserInfo
    {
        public Guid UserInfoId { get; set; }
        public Guid UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public Guid UserTypeId { get; set; }
        public string ContactNo { get; set; }
        public string Location { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? LastModifiedBy { get; set; }
        public DateTime? LastModifiedDate { get; set; }
    }

    public class UserList
    {
        public Guid UserId { get; set; }
        public string EmailId { get; set; }
        public bool? IsActive { get; set; }
        public string ContactNo { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Location { get; set; }
        public Guid UserInfoId { get; set; }
        public string UserType { get; set; }
    }

    public class CheckLogin
    {
        public string emailId { get; set; }
        public string password { get; set; }
    }
}
