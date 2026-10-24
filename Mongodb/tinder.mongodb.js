use("maxitinder");

db.usuarios.insertOne(
    {
        "nombre": "Pepito",
        "fotos": [
            {
                "fecha_subida": "2024-06-01",
                "imagen": "https://example.com/foto1.jpg"
            },
            {
                "fecha_subida": "2024-06-02",
                "imagen": "https://example.com/foto2.jpg"
            }
        ],
        "edad": 25,
        "descripcion": "Pepito juega a la pelota.",
        "intereses": ["futbol", "fumar", "cerveza"]
    }
);

df.usuarios.insertMany([
     {
        "nombre": "Maria",
        "fotos": [
            {
                "fecha_subida": "2024-06-01",
                "imagen": "https://example.com/foto1.jpg"
            },
            {
                "fecha_subida": "2024-06-02",
                "imagen": "https://example.com/foto2.jpg"
            }
        ],
        "edad": 35,
        "descripcion": "Maria es una persona muy simpática.",
        "intereses": ["futbol", "fumar", "cerveza"]
    },
     {
        "nombre": "Pepito",
        "fotos": [
            {
                "fecha_subida": "2024-06-01",
                "imagen": "https://example.com/foto1.jpg"
            },
            {
                "fecha_subida": "2024-06-02",
                "imagen": "https://example.com/foto2.jpg"
            }
        ],
        "edad": 25,
        "descripcion": "Pepito juega a la pelota.",
        "intereses": ["futbol", "fumar", "cerveza"]
    }
])

use("maxitinder");
use.usuarios.findOne({"nombre": "Pepito"});

use("maxitinder");
db.usuarios.deleteOne({"nombre": "Matias"});

