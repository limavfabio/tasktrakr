# TaskTrakr

TaskTrakr is a web-based task management application built with Ruby on Rails and Turbo Streams. It allows you to efficiently track and manage your tasks in real-time without the need for full page reloads.

## Features

- **Real-Time Updates**: TaskTrakr leverages Turbo Streams and Stimulus to provide real-time updates when adding or removing tasks, reordering tasks, and more.
- **Drag and Drop**: Easily reorder tasks by dragging and dropping them within your project board.
- **User Authentication**: Secure user authentication system to protect your data.
- **Project Management**: Organize tasks into projects for better task management.
- **Clean and Intuitive Interface**: A user-friendly interface that makes task management a breeze.

## Getting Started

### Prerequisites

Before you begin, ensure you have met the following requirements:

- Ruby: 2.7+
- Rails: 6.0+
- PostgreSQL: 10+
- Node.js: 12+
- Yarn: 1.0+

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/tasktrakr.git
   ```

2. Navigate to the project directory:

   ```bash
   cd tasktrakr
   ```

3. Install gem dependencies:

   ```bash
   bundle install
   ```

4. Install JavaScript dependencies:

   ```bash
   yarn install
   ```

5. Set up the database:

   ```bash
   rails db:setup
   ```

6. Start the dev server:

   ```bash
   bin/dev
   ```

TaskTrakr should now be accessible at `http://localhost:3000`.

### Usage

1. Create an account or log in if you already have one.
2. Create a new project or select an existing one.
3. Add, remove, or reorder tasks in real-time using the intuitive drag-and-drop interface.

## Contributing

Contributions are welcome! If you'd like to contribute to TaskTrakr, please follow these steps:

1. Fork the repository on GitHub.
2. Create a new branch for your feature or bug fix.
3. Make your changes and commit them with clear commit messages.
4. Push your changes to your fork.
5. Submit a pull request to the main repository.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- TaskTrakr was built using Ruby on Rails, Turbo Streams, Stimulus, and more.
- Thanks to the open-source community for providing valuable tools and resources.
