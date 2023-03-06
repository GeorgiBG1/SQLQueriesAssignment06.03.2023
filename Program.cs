using System;
using System.Data.SqlClient;

namespace AssignmentSQLQueries
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string connectionString = "Server=.;Database=MinionsDB;" +
                "Integrated Security=true;TrustServerCertificate=true;";
            SqlConnection sqlConnection = new SqlConnection(connectionString);

            using (sqlConnection)
            {
                sqlConnection.Open();
                string command = $"SELECT * FROM Villians";
                SqlCommand sqlCommand = new SqlCommand(command, sqlConnection);
                int result = (int)sqlCommand.ExecuteScalar();
                Console.WriteLine(result);
            }
        }
    }
}
