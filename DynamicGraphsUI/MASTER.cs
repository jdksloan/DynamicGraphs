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
    
    public partial class MASTER
    {
        public string M_PoolID { get; set; }
        public string M_LoanID { get; set; }
        public string M_BorrowerID { get; set; }
        public string ClassType { get; set; }
        public Nullable<double> OriginalPrincipalBalance { get; set; }
        public Nullable<System.DateTime> LoanOriginationDate { get; set; }
        public Nullable<System.DateTime> MaturityDate { get; set; }
        public Nullable<double> TermToMaturity { get; set; }
        public Nullable<double> Guarantee { get; set; }
        public Nullable<int> LoanTypeIndicator { get; set; }
        public string Sector { get; set; }
    
        public virtual INCOME INCOME { get; set; }
        public virtual MORTGAGE MORTGAGE { get; set; }
        public virtual RATE RATE { get; set; }
        public virtual SECURITIZATION SECURITIZATION { get; set; }
        public virtual VALUATION VALUATION { get; set; }
    }
}
