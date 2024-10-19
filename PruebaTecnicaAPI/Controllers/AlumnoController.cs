using Core.Entities;
using Infrastructure.Queries.interfaces;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace PruebaTecnicaAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AlumnoController : ControllerBase
    {
        private readonly IAlumnoQuery _alumnoQuery;

        // Constructor con inyección de dependencias
        public AlumnoController(IAlumnoQuery alumnoQuery)
        {
            _alumnoQuery = alumnoQuery;
        }

        // Acción de prueba para saludar
        [Route("saludar")]
        [HttpGet]
        public ActionResult Saludo()
        {
            return Ok("Saludos Inlearning");
        }

        // Acción para listar todos los alumnos
        [Route("listar")]
        [HttpGet]
        public async Task<IActionResult> ListarAlumnos()
        {
            var alumnos = await _alumnoQuery.ListarAlumnos();
            return Ok(alumnos);
        }

        // Acción para crear un nuevo alumno
        [Route("crear")]
        [HttpPost]
        public async Task<IActionResult> CrearAlumno([FromBody] Alumno alumno)
        {
            if (alumno == null)
            {
                return BadRequest("Datos del alumno no proporcionados.");
            }

            await _alumnoQuery.CrearAlumno(alumno);
            return Ok("Alumno creado exitosamente.");
        }

        // Acción para actualizar un alumno existente
        [Route("actualizar")]
        [HttpPut]
        public async Task<IActionResult> ActualizarAlumno([FromBody] Alumno alumno)
        {
            if (alumno == null)
            {
                return BadRequest("Datos del alumno no proporcionados.");
            }

            await _alumnoQuery.ActualizarAlumno(alumno);
            return Ok("Alumno actualizado exitosamente.");
        }

        // Acción para eliminar un alumno
        [Route("eliminar/{id}")]
        [HttpDelete]
        public async Task<IActionResult> EliminarAlumno(int id)
        {
            if (id <= 0)
            {
                return BadRequest("ID de alumno inválido.");
            }

            await _alumnoQuery.EliminarAlumno(id);
            return Ok("Alumno eliminado exitosamente.");
        }
    }
}
