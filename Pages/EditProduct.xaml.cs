using System;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Navigation;
using test.Classes;

namespace test.Pages
{
    /// <summary>
    /// Логика взаимодействия для EditProduct.xaml
    /// </summary>
    public partial class EditProduct : Page
    {
        private Products editingProduct;
        private bool isEditMode;

        public EditProduct(int? productId = null)
        {
            InitializeComponent();
            this.Loaded += EditProduct_Loaded;
            LoadProductTypes();
            if (productId != null)
            {
                isEditMode = true;
                editingProduct = Helper.ConnectDB.Products.FirstOrDefault(p => p.ID_Product == productId);
                FillFields(editingProduct);
            }
            else
            {
                isEditMode = false;
                editingProduct = new Products();
            }
        }

        private void EditProduct_Loaded(object sender, RoutedEventArgs e)
        {
            if (isEditMode)
                Helper.PageName.Text = "РЕДАКТИРОВАНИЕ ПРОДУКТА";
            else
                Helper.PageName.Text = "ДОБАВЛЕНИЕ ПРОДУКТА";
        }

        private void LoadProductTypes()
        {
            cbProductType.ItemsSource = Helper.ConnectDB.Product_type.ToList();
            cbProductType.DisplayMemberPath = "TypeProduct";
            cbProductType.SelectedValuePath = "ID_ProductType";
        }

        private void FillFields(Products product)
        {
            tbArticul.Text = product.Articul?.ToString();
            cbProductType.SelectedValue = product.IDTypeProduct;
            tbName.Text = product.NameProduct;
            tbMinCost.Text = product.MinCostForPartner?.ToString("F2");
            tbRollWidth.Text = product.RollWidthMetr?.ToString("F2");
        }

        private bool ValidateFieldsSimple()
        {
            if (string.IsNullOrWhiteSpace(tbArticul.Text) ||
                cbProductType.SelectedValue == null ||
                string.IsNullOrWhiteSpace(tbName.Text) ||
                string.IsNullOrWhiteSpace(tbMinCost.Text) ||
                string.IsNullOrWhiteSpace(tbRollWidth.Text))
            {
                MessageBox.Show("Пожалуйста, заполните все поля.");
                return false;
            }
            return true;
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            if (!ValidateFieldsSimple())
                return;

            // Просто преобразуем значения без проверок
            double articul = double.Parse(tbArticul.Text.Replace(',', '.'), System.Globalization.CultureInfo.InvariantCulture);
            int typeId = int.Parse(cbProductType.SelectedValue.ToString());
            string name = tbName.Text.Trim();
            double minCost = double.Parse(tbMinCost.Text.Replace(',', '.'), System.Globalization.CultureInfo.InvariantCulture);
            double rollWidth = double.Parse(tbRollWidth.Text.Replace(',', '.'), System.Globalization.CultureInfo.InvariantCulture);

            editingProduct.Articul = articul;
            editingProduct.IDTypeProduct = typeId;
            editingProduct.NameProduct = name;
            editingProduct.MinCostForPartner = minCost;
            editingProduct.RollWidthMetr = rollWidth;

            if (!isEditMode)
            {
                Helper.ConnectDB.Products.Add(editingProduct);
            }

            Helper.ConnectDB.SaveChanges();
            MessageBox.Show("Продукт успешно сохранен.");
            NavigationService.GoBack();
        }

        private void btnCancel_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}
