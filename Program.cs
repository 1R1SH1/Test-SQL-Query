using Microsoft.Data.SqlClient;
using System;
using System.Threading.Tasks;

namespace TestSQLQueryApp
{
    class Program
    {
        static SqlConnectionStringBuilder Con = new SqlConnectionStringBuilder()
        {
            DataSource = @"DESKTOP-V784SJL",
            InitialCatalog = "ShopTest",
            IntegratedSecurity = true,
            Encrypt = true,
            TrustServerCertificate = true
        };

        static async Task Main()
        {
            string sqlExpression = "SELECT P.Name, C.Name " +
                                   "FROM Products P " +
                                   "LEFT JOIN ProductCategories PC " +
                                   "ON P.Id = PC.ProductId " +
                                   "INNER JOIN Categories C " +                                    
                                   "ON PC.CategoryId = C.Id " +
                                   "ORDER BY P.Name";

            using (SqlConnection con = new SqlConnection(Con.ConnectionString))
            {
                await con.OpenAsync();

                SqlCommand command = new SqlCommand(sqlExpression, con);
                SqlDataReader reader = await command.ExecuteReaderAsync();

                if (reader.HasRows)
                {
                    string columnName1 = reader.GetName(0);
                    string columnName2 = reader.GetName(1);

                    Console.WriteLine($"{columnName1}\t{columnName2}");

                    while (await reader.ReadAsync())
                    {
                        object cname = reader.GetValue(0);
                        object pname = reader.GetValue(1);

                        Console.WriteLine($"{cname}\t{pname}");
                    }
                }

                await reader.CloseAsync();
            }
            Console.Read();
        }
    }
}
