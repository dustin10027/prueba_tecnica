using Core.Entities;
using Dapper;
using System.Data;

namespace Infrastructure.Queries
{
    public class AlumnoQueryBase
    {

        // Método para crear un nuevo alumno
        public async Task CrearAlumno(Alumno alumno)
        {
            using SqlConnection conn = new SqlConnection(_connectionString);
            var param = new DynamicParameters();

            param.Add("@Nombre", alumno.Nombre);
            param.Add("@Apellido", alumno.Apellido);
            param.Add("@FechaNacimiento", alumno.FechaNacimiento);
            param.Add("@IdAula", alumno.IdAula);

            await conn.ExecuteAsync("spCrearAlumno", param, commandType: CommandType.StoredProcedure);
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
    }
}