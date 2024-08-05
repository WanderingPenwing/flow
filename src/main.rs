use winit::event_loop::EventLoop;

fn main() {
    match EventLoop::new() {
        Ok(_event_loop) => {
            println!("Event loop created successfully");
        }
        Err(e) => {
            eprintln!("Failed to create event loop: {:?}", e);
        }
    }
}
