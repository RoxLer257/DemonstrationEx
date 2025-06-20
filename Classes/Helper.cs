using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Controls;

namespace test.Classes
{
    class Helper
    {
        public static TextBlock PageName;
        public static Frame frmObj;
        public static DemEntities ConnectDB = new DemEntities();

        public static int CalculateMaterialPurchase(int productTypeId, int materialTypeId, int productCount, double param1, double param2, double materialOnStock)
        {
            if (productTypeId <= 0 || materialTypeId <= 0 || productCount <= 0 || param1 <= 0 || param2 <= 0 || materialOnStock < 0)
                return -1;
            var productType = ConnectDB.Product_type.FirstOrDefault(pt => pt.ID_ProductType == productTypeId);
            var materialType = ConnectDB.Material_type.FirstOrDefault(mt => mt.ID_TypeMaterial == materialTypeId);
            if (productType == null || materialType == null)
                return -1;
            double koeff = productType.KoeffTypeProduct ?? 1.0;
            double defectPercent = materialType.PercentMaterial ?? 0.0;
            // Требуемое количество материала на одну единицу продукции
            double materialPerProduct = param1 * param2 * koeff;
            // Всего нужно материала с учетом количества продукции
            double totalMaterial = materialPerProduct * productCount;
            // Учитываем брак
            totalMaterial = totalMaterial * (1.0 + defectPercent / 100.0);
            // Вычитаем то, что есть на складе
            double toBuy = totalMaterial - materialOnStock;
            if (toBuy < 0) toBuy = 0;
            return (int)System.Math.Ceiling(toBuy);
        }
    }
}
