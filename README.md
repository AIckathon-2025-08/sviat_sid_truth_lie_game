# Truth or Lie Game

A fun and interactive web-based game perfect for town hall meetings and team building activities. Players are presented with three statements about a candidate - two truths and one lie - and must guess which statement is the lie.

## 🎯 Game Concept

The "Two Truths and a Lie" game is a classic icebreaker that challenges participants to identify the false statement among three presented facts. This digital version makes it perfect for:

- **Town Hall Meetings**: Introduce new team members or candidates
- **Team Building**: Break the ice and learn interesting facts about colleagues
- **Corporate Events**: Engage large groups in interactive activities
- **Remote Teams**: Connect distributed teams through fun challenges

## 📱 Screenshots

Screenshots will be added to the `screenshots/` directory. See `screenshots/README.md` for details on how to capture and add them.

### Required Screenshots
- **Homepage**: Showing active games and navigation
- **Game Creation**: Admin interface for setting up new games
- **Voting Interface**: Player voting experience with statements
- **Results Dashboard**: Live results with charts and statistics

## 🎥 Demo Video

A demo video will be created showing the game in action. The video should demonstrate:

- Creating a new game as an admin
- Employees participating in voting
- Real-time results updates
- Overall user experience and flow

*See how easy it is to create games, collect votes, and reveal results in real-time.*

## ✨ Features

### 🎮 **Game Management**
- **Admin Interface**: Create new games with candidate photos and names
- **Statement Builder**: Craft 3 statements (2 truths, 1 lie) per game
- **Game Tracking**: Monitor active games and their status

### 👥 **Voting System**
- **Employee Participation**: Each employee can vote once per game
- **Anonymous Voting**: Names are collected but votes remain private
- **Real-time Results**: Live updates as votes come in

### 📊 **Results & Analytics**
- **Live Dashboard**: See voting results in real-time
- **Visual Charts**: Progress bars and percentage displays
- **Voting Summary**: Most and least voted statements
- **Truth Reveal**: See which statements were actually true/false

### 🎨 **User Experience**
- **Modern UI**: Clean, responsive design with smooth animations
- **Mobile Friendly**: Works perfectly on all devices
- **Intuitive Navigation**: Easy-to-use interface for all skill levels

## 🚀 Quick Start

### Prerequisites
- Docker and Docker Compose installed
- Git for cloning the repository

### Running the Application

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd truth_lie_game
   ```

2. **Start the application with Docker**
   ```bash
   docker-compose -f docker-compose.dev.yml up --build
   ```

3. **Open your browser**
   Navigate to `http://localhost:3000`

4. **Create your first game**
   - Click "New Game" to set up a candidate
   - Add their photo URL and name
   - Create 3 statements (2 truths, 1 lie)
   - Share the generated link with your team!

## 🐳 Docker Commands

### Development Mode
```bash
# Start the development server
docker-compose -f docker-compose.dev.yml up --build

# Stop the server
docker-compose -f docker-compose.dev.yml down

# View logs
docker-compose -f docker-compose.dev.yml logs -f
```

### Production Mode
```bash
# Build and run production container
docker build -t truth_lie_game .
docker run -d -p 80:80 -e RAILS_MASTER_KEY=<your_master_key> truth_lie_game
```

## 🎯 How to Play

### For Admins (Game Creators)
1. **Create a New Game**
   - Navigate to "New Game"
   - Enter candidate's name and photo URL
   - Write 3 statements (2 true, 1 false)
   - Mark each statement as truth or lie
   - Save and start the game

2. **Monitor Progress**
   - View live voting results
   - Track participation rates
   - See which statements are most confusing

### For Players (Employees)
1. **Join a Game**
   - Select an active game from the homepage
   - Enter your name to participate
   - Read the 3 statements carefully

2. **Make Your Choice**
   - Consider which statement seems most suspicious
   - Click on the statement you think is the lie
   - Submit your vote

3. **View Results**
   - See how your vote compares to others
   - Discover which statement was actually the lie
   - Learn interesting facts about your colleague!

## 🏗️ Technical Architecture

### Backend
- **Ruby on Rails 8.0**: Modern, fast web framework
- **Session-Based Storage**: In-memory game sessions with unique tokens
- **RESTful API**: Clean, predictable endpoints
- **Session Management**: Secure user tracking and game state

### Frontend
- **ERB Templates**: Server-side rendering for SEO
- **CSS Grid & Flexbox**: Responsive, modern layouts
- **Font Awesome Icons**: Professional visual elements
- **Progressive Enhancement**: Works without JavaScript

### Session Structure
```
GameSession
├── token (string, unique identifier)
├── candidate_name (string)
├── candidate_photo (string)
├── statements (array of statement objects)
│   ├── id (uuid)
│   ├── content (text)
│   ├── is_truth (boolean)
│   └── order (integer)
├── votes (array of vote objects)
│   ├── id (uuid)
│   ├── employee_name (string)
│   ├── statement_id (uuid)
│   └── voted_at (datetime)
└── created_at (datetime)
```

## 🚀 Deployment

### Production Deployment
1. **Set environment variables**
   ```bash
   export RAILS_MASTER_KEY=<your_master_key>
   export RAILS_ENV=production
   ```

2. **Build and deploy**
   ```bash
   docker build -t truth_lie_game .
   docker run -d -p 80:80 -e RAILS_MASTER_KEY=$RAILS_MASTER_KEY truth_lie_game
   ```

### Cloud Deployment
- **Heroku**: Use the provided Dockerfile
- **AWS ECS**: Deploy as a containerized service
- **Google Cloud Run**: Serverless container deployment
- **DigitalOcean App Platform**: Simple container deployment

## 🤝 Contributing

We welcome contributions! Here's how to get started:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Setup
```bash
# Install dependencies
bundle install

# Run tests
bundle exec rspec

# Start development server
rails server
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- **Rails Team**: For the amazing web framework
- **Font Awesome**: For the beautiful icons
- **CSS Grid**: For the responsive layouts
- **Docker**: For making deployment simple

## 📞 Support

Need help? Here are some resources:

- **Issues**: [GitHub Issues](https://github.com/AIckathon-2025-08/sviat_sid_truth_lie_game/issues)
- **Email**: sviatoslav_sicelnykov@epam.com

---

**Made with ❤️ for better team building and town hall experiences!**
