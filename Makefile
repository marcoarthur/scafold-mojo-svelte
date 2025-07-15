.PHONY: init backend frontend run build clean all
BACKEND_DIRS = lib public script t
FRONTEND_DIRS = lib assets
SERVER   = backend/lib/MyApp.pm
CONTROLLER = backend/lib/MyApp/Controller/Echo.pm
SCRIPT = backend/script/myapp
FRONTEND = frontend/src/App.svelte
FE_CONF = frontend/src/config.js
BEND_FILES = $(SERVER) $(CONTROLLER) $(SCRIPT)

all: init backend frontend run

init:
	@echo "Setting up project structure..."
	$(foreach dir,$(BACKEND_DIRS),mkdir -p backend/$(dir);)
	$(foreach dir,$(FRONTEND_DIRS),mkdir -p frontend/src/$(dir);)
	cd backend && echo "requires 'Mojolicious', '>= 9.0';" > cpanfile
	cd frontend && npm create vite@latest . -- --template svelte

backend_files: $(BEND_FILES)

$(SERVER): templates/myapp.pm
	@echo "Creating $(SERVER)..."
	@mkdir -p $(dir $@) && touch $@
	cp templates/myapp.pm $@

$(CONTROLLER): templates/controller.pm
	@echo "Creating $(CONTROLLER)"
	@mkdir -p $(dir $@) && touch $@
	cp templates/controller.pm $@

$(SCRIPT): templates/myapp
	@echo "Creating $(SCRIPT)"
	@mkdir -p $(dir $@) && touch $@
	cp templates/myapp $@
	chmod +x $@

backend: backend_files
	@echo "Installing Perl dependencies..."
	cd backend && carton install

frontend:
	@echo "Installing Node.js dependencies..."
	cd frontend && npm install
	@echo "Creating $(FRONTEND)"
	cp templates/App.svelte $(FRONTEND)
	cp templates/config.js $(FE_CONF)

run:
	@echo "Starting development servers..."
	cd backend && carton exec -- morbo script/myapp daemon -l http://*:8080 &
	cd frontend && npm run dev

build:
	@echo "Building production frontend..."
	cd frontend && npm run build
	cp -R frontend/dist/* backend/public/

clean:
	@echo "Cleaning up..."
	rm -rf backend
	rm -rf frontend
