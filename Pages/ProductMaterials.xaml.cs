using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using test.Classes;

namespace test.Pages
{
    /// <summary>
    /// Логика взаимодействия для ProductMaterials.xaml
    /// </summary>
    public partial class ProductMaterials : Page
    {
        public ProductMaterials(int productId)
        {
            InitializeComponent();
            LoadMaterials(productId);
        }

        private void LoadMaterials(int productId)
        {
            var materials = Helper.ConnectDB.Product_materials
                .Where(pm => pm.IDProduct == productId)
                .Select(pm => new {
                    NameMaterial = pm.Materials.NameMaterial,
                    NuzhnoQuantityMaterial = pm.NuzhnoQuantityMaterial
                })
                .ToList();

            cbProductType.ItemsSource = Helper.ConnectDB.Product_type.ToList();
            cbMaterialType.ItemsSource = Helper.ConnectDB.Material_type.ToList();
            lvMaterials.ItemsSource = materials;
        }

        private void BtnBack_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void BtnCalc_Click(object sender, RoutedEventArgs e)
        {
            // Проверяем, что выбран тип продукции и тип материала
            if (cbProductType.SelectedValue == null || cbMaterialType.SelectedValue == null)
            {
                tbCalcResult.Text = "Проверьте корректность всех введённых данных!";
                return;
            }
            // Пробуем получить ID из SelectedValue
            if (!int.TryParse(cbProductType.SelectedValue.ToString(), out int productTypeId) ||
                !int.TryParse(cbMaterialType.SelectedValue.ToString(), out int materialTypeId) ||
                !int.TryParse(tbProductCount.Text, out int productCount) ||
                !double.TryParse(tbParam1.Text.Replace(',', '.'), System.Globalization.NumberStyles.Any, System.Globalization.CultureInfo.InvariantCulture, out double param1) ||
                !double.TryParse(tbParam2.Text.Replace(',', '.'), System.Globalization.NumberStyles.Any, System.Globalization.CultureInfo.InvariantCulture, out double param2) ||
                !double.TryParse(tbMaterialOnStock.Text.Replace(',', '.'), System.Globalization.NumberStyles.Any, System.Globalization.CultureInfo.InvariantCulture, out double materialOnStock))
            {
                tbCalcResult.Text = "Проверьте корректность всех введённых данных!";
                return;
            }
            int result = Helper.CalculateMaterialPurchase(productTypeId, materialTypeId, productCount, param1, param2, materialOnStock);
            if (result == -1)
                tbCalcResult.Text = "Ошибка расчёта: проверьте параметры и существование типов.";
            else
                tbCalcResult.Text = $"Необходимо закупить: {result} ед.";
        }
    }
}
