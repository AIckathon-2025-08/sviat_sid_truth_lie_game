.PHONY: help start stop build test clean logs

help: ## Show this help message
	@echo "Truth or Lie Game - Available Commands:"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

start: ## Start the development server
	@echo "🚀 Starting Truth or Lie Game..."
	./start.sh

stop: ## Stop the development server
	@echo "🛑 Stopping Truth or Lie Game..."
	docker-compose -f docker-compose.dev.yml down

restart: stop start ## Restart the development server

build: ## Build the Docker image
	@echo "🔨 Building Docker image..."
	docker-compose -f docker-compose.dev.yml build

logs: ## View application logs
	@echo "📋 Viewing logs..."
	docker-compose -f docker-compose.dev.yml logs -f

test: ## Run the test suite
	@echo "🧪 Running tests..."
	docker-compose -f docker-compose.dev.yml exec web rails test

db-setup: ## Set up sample data
	@echo "🗄️ Setting up sample data..."
	docker-compose -f docker-compose.dev.yml exec web rails db:seed

db-reset: ## Reset sample data
	@echo "🔄 Resetting sample data..."
	docker-compose -f docker-compose.dev.yml exec web rails db:seed

clean: ## Clean up Docker containers and images
	@echo "🧹 Cleaning up..."
	docker-compose -f docker-compose.dev.yml down -v
	docker system prune -f

shell: ## Open a shell in the running container
	@echo "🐚 Opening shell..."
	docker-compose -f docker-compose.dev.yml exec web bash

status: ## Show the status of containers
	@echo "📊 Container status:"
	docker-compose -f docker-compose.dev.yml ps
