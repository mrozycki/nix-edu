use uuid::Uuid;

fn main() {
    println!("Hello, world! {}", Uuid::new_v4());
}

mod test {
    #[test]
    fn test() {
        assert_eq!(2 + 2, 4);
    }
}
