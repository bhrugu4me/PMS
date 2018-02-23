using System;

namespace PMSModels
{
    public class Project
    {
        public Guid? ProjectId { get; set; }
        public string ProjectName { get; set; }
        public Guid ProjectTypeId { get; set; }
        public string ClientName { get; set; }
        public string ClientEmail { get; set; }
        public string ClientContact { get; set; }
        public string ProjectDescription { get; set; }
        public string Technology { get; set; }
        public Guid? ProjectManagerId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? LastModifiedBy { get; set; }
        public DateTime? LastModifiedDate { get; set; }
        public Guid? RequestorId { get; set; }
    }

    public class ProjectList
    {
        public string ClientContact { get; set; }
        public string ClientEmail { get; set; }
        public string ClientName { get; set; }
        public Guid? LastModifiedBy { get; set; }
        public DateTime? LastModifiedDate { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? CreatedBy { get; set; }
        public string ProjectDescription { get; set; }
        public Guid ProjectId { get; set; }
        public Guid? ProjectManagerId { get; set; }
        public string ProjectName { get; set; }
        public Guid ProjectTypeId { get; set; }
        public string Technology { get; set; }
        public string EmailId { get; set; }
        public string ContactNo { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public Guid UserInfoId { get; set; }
        public string Location { get; set; }
        public string UserType { get; set; }
        public Guid UserTypeId { get; set; }
        public string ProjectType { get; set; }
    }

    public class GetProjectRequest
    {
        public Guid? ProjectId { get; set; }
        public Guid? ProjectManagerId { get; set; }
    }

}
