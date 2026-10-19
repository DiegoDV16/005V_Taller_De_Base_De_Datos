use('peliculas_lukas');


db.movie.insertMany(
    [
    {
        "titulo": "hachiko",
        "duracion": "120 min",
        "genero": [
            "drama", 
            "suspenso"
        ],
    },
    {   
        "titulo": "el padrino",
        "duracion": "175 min",
        
    }
    ]
)


use('peliculas_lukas');

db.movie.find();
