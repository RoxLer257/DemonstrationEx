//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace test.Classes
{
    using System;
    using System.Collections.Generic;
    
    public partial class Products
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Products()
        {
            this.Product_materials = new HashSet<Product_materials>();
        }
    
        public int ID_Product { get; set; }
        public Nullable<int> IDTypeProduct { get; set; }
        public string NameProduct { get; set; }
        public Nullable<double> Articul { get; set; }
        public Nullable<double> MinCostForPartner { get; set; }
        public Nullable<double> RollWidthMetr { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Product_materials> Product_materials { get; set; }
        public virtual Product_type Product_type { get; set; }
    }
}
