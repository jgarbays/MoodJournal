using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MoodJournal.Models
{
   public class Usuario
    {
        public string id{ get; set; }

        public string nombre_usuario { get; set; }

        public string nombre_apellidos { get; set; }

        public string fecha_nacimiento { get; set; }

        public string email { get; set; }

        public string contrasena { get; set; }
    }
}
