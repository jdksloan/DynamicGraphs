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
    
    public partial class RATE
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public RATE()
        {
            this.HISTORY_RATES = new HashSet<HISTORY_RATES>();
        }
    
        public string M_PoolID { get; set; }
        public string M_LoanID { get; set; }
        public Nullable<System.DateTime> ReversionaryDate { get; set; }
        public string InterestStartDate { get; set; }
        public Nullable<double> RemainingFixedRateTerm { get; set; }
        public Nullable<System.DateTime> PrincipalStartDate { get; set; }
        public Nullable<double> OriginalFixedRateTerm { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<HISTORY_RATES> HISTORY_RATES { get; set; }
        public virtual MASTER MASTER { get; set; }
    }
}