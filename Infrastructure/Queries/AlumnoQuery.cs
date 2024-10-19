using Core.Entities;
using Dapper;
using Infrastructure.Queries.interfaces;
using Microsoft.Extensions.Configuration;
using System.Data;

namespace Infrastructure.Queries
{
    public class AlumnoQuery : IAlumnoQuery
    {
        private readonly string ConnectionString;

        public AlumnoQuery(IConfiguration configuration)
        {
            // Deberá modificar la cadena de conexión antes de ejecutar
            ConnectionString = ConfigurationExtensions.GetConnectionString(configuration, "PruebaTecnicaDB");
        }
        // Método para actualizar un alumno
        public async Task ActualizarAlumno(Alumno alumno)
        {
            using SqlConnection conn = new SqlConnection(ConnectionString);
            var param = new DynamicParameters();

            param.Add("@IdAlumno", alumno.IdAlumno);
            param.Add("@Nombre", alumno.Nombre);
            param.Add("@Apellido", alumno.Apellido);
            param.Add("@FechaNacimiento", alumno.FechaNacimiento);
            param.Add("@IdAula", alumno.IdAula);

            await conn.ExecuteAsync("spActualizarAlumno", param, commandType: CommandType.StoredProcedure);
        }


        // Método para crear un alumno
        public async Task CrearAlumno(Alumno alumno)
        {
            using SqlConnection conn = new SqlConnection(ConnectionString);
            var param = new DynamicParameters();

            param.Add("@Nombre", alumno.Nombre);
            param.Add("@Apellido", alumno.Apellido);
            param.Add("@FechaNacimiento", alumno.FechaNacimiento);
            param.Add("@IdAula", alumno.IdAula);

            await conn.ExecuteAsync("spCrearAlumno", param, commandType: CommandType.StoredProcedure);
        }


        // Método para eliminar un alumno
        public async Task EliminarAlumno(int idAlumno)
        {
            using SqlConnection conn = new SqlConnection(ConnectionString);
            var param = new DynamicParameters();

            param.Add("@IdAlumno", idAlumno);

            await conn.ExecuteAsync("spEliminarAlumno", param, commandType: CommandType.StoredProcedure);
        }

        // Método para listar alumnos
        public async Task<IEnumerable<dynamic>> ListarAlumnos()
        {
            using SqlConnection conn = new SqlConnection(ConnectionString);
            var result = await conn.QueryAsync("spListarAlumnos", commandType: CommandType.StoredProcedure);
            return result;
        }
    }
}
