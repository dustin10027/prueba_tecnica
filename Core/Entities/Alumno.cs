namespace Core.Entities
{
    public class Alumno
    {
        public int IdAlumno { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public DateTime FechaNacimiento {  get; set; }
        public int IdAula { get; set; }
    }
}
