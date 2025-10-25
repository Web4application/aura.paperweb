use actix_files::NamedFile;
use actix_web::{get, post, web, App, HttpResponse, HttpServer, Responder};
use serde::{Deserialize, Serialize};
use std::sync::Mutex;

#[derive(Serialize, Deserialize)]
struct Counter {
    value: i32,
}

struct AppState {
    counter: Mutex<Counter>,
}

#[get("/api/counter")]
async fn get_counter(data: web::Data<AppState>) -> impl Responder {
    let counter = data.counter.lock().unwrap();
    HttpResponse::Ok().json(&*counter)
}

#[post("/api/counter/increment")]
async fn increment_counter(data: web::Data<AppState>) -> impl Responder {
    let mut counter = data.counter.lock().unwrap();
    counter.value += 1;
    HttpResponse::Ok().json(&*counter)
}

async fn index() -> actix_web::Result<NamedFile> {
    Ok(NamedFile::open("backend/static/index.html")?)
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    let counter = Counter { value: 0 };
    let state = web::Data::new(AppState {
        counter: Mutex::new(counter),
    });

    println!("🚀 Actix server running at http://127.0.0.1:8080");

    HttpServer::new(move || {
        App::new()
            .app_data(state.clone())
            .service(get_counter)
            .service(increment_counter)
            .route("/", web::get().to(index))
            .service(actix_files::Files::new("/", "backend/static"))
    })
    .bind(("127.0.0.1", 8080))?
    .run()
    .await
}
