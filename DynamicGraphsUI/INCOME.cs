//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DynamicGraphsUI
{
    using System;
    using System.Collections.Generic;
    
    public partial class INCOME
    {
        public string M_PoolID { get; set; }
        public string M_LoanID { get; set; }
        public Nullable<double> DTI { get; set; }
        public Nullable<double> LTI { get; set; }
        public string SelfCertification { get; set; }
        public string EmploymentStatus { get; set; }
        public Nullable<double> TotalIncome { get; set; }
        public Nullable<System.DateTime> BorrowerBirthDate { get; set; }
        public Nullable<decimal> IndexedDTI { get; set; }
        public Nullable<decimal> IndexedLTI { get; set; }
        public Nullable<decimal> IndexedTotalIncome { get; set; }
        public Nullable<decimal> MaxBorrowerIncome { get; set; }
        public Nullable<decimal> BorrowerTotalIncome { get; set; }
        public Nullable<decimal> LivingExpenses { get; set; }
        public Nullable<decimal> CurrentInterestShock { get; set; }
        public Nullable<decimal> MonthlyNetIncome { get; set; }
        public Nullable<decimal> MonthlyMortgageInterest { get; set; }
        public Nullable<decimal> MonthlyMortgagePrincipal { get; set; }
        public Nullable<decimal> MonthlyIncomeBuffer { get; set; }
    
        public virtual MASTER MASTER { get; set; }
    }
}
