#!/bin/bash

echo "🧪 Testing Truth or Lie Game Application..."
echo "=========================================="

# Test if the application is running
echo "1. Checking if application is accessible..."
if curl -s http://localhost:3000 > /dev/null; then
    echo "✅ Application is running and accessible at http://localhost:3000"
else
    echo "❌ Application is not accessible"
    exit 1
fi

# Test the homepage
echo "2. Testing homepage..."
if curl -s http://localhost:3000 | grep -q "Truth or Lie Game"; then
    echo "✅ Homepage is working correctly"
else
    echo "❌ Homepage is not working correctly"
fi

# Test the new game page
echo "3. Testing new game page..."
if curl -s http://localhost:3000/games/new | grep -q "Create New Game"; then
    echo "✅ New game page is working correctly"
else
    echo "❌ New game page is not working correctly"
fi

# Test if sample data is loaded
echo "4. Testing sample data..."
if curl -s http://localhost:3000 | grep -q "Sarah Johnson"; then
    echo "✅ Sample game data is loaded correctly"
else
    echo "❌ Sample game data is not loaded"
fi

echo ""
echo "🎉 Application testing completed!"
echo "🌐 Open http://localhost:3000 in your browser to see the game in action!"
echo ""
echo "📱 Available commands:"
echo "   make start    - Start the application"
echo "   make stop     - Stop the application"
echo "   make logs     - View application logs"
echo "   make test     - Run the test suite"
echo "   make help     - Show all available commands"
