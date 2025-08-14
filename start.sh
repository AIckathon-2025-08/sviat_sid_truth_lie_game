#!/bin/bash

echo "🎮 Starting Truth or Lie Game..."
echo "=================================="

# Check if Docker is running
if ! docker info > /dev/null 2>&1; then
    echo "❌ Docker is not running. Please start Docker and try again."
    exit 1
fi

# Check if docker-compose is available
if ! command -v docker-compose &> /dev/null; then
    echo "❌ docker-compose is not installed. Please install it and try again."
    exit 1
fi

echo "🐳 Building and starting the application..."
docker-compose -f docker-compose.dev.yml up --build -d

echo "⏳ Waiting for the application to start..."
sleep 10

echo "🗄️ Setting up sample data..."
docker-compose -f docker-compose.dev.yml exec web rails db:seed

echo "✅ Application is ready!"
echo "🌐 Open your browser and go to: http://localhost:3000"
echo ""
echo "📱 To stop the application, run:"
echo "   docker-compose -f docker-compose.dev.yml down"
echo ""
echo "📊 To view logs, run:"
echo "   docker-compose -f docker-compose.dev.yml logs -f"
