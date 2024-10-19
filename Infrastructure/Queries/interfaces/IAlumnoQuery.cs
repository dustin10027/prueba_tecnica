using Core.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Infrastructure.Queries.interfaces
{
    public interface IAlumnoQuery
    {
        
        Task<IEnumerable<dynamic>> ListarAlumnos();

        
        Task CrearAlumno(Alumno alumno);

       
        Task ActualizarAlumno(Alumno alumno);

        
        Task EliminarAlumno(int idAlumno);
    }
}

