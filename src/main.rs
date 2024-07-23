use winit::event_loop::EventLoop;

fn main() {
    match EventLoop::new() {
        Ok(event_loop) => {
            // Event loop was created successfully, you can use `event_loop` here
            println!("Event loop created successfully");
        }
        Err(e) => {
            // Handle the error
            eprintln!("Failed to create event loop: {:?}", e);
        }
    }
}
