build:
    dotnet build

ci-format:
    dotnet format --verify-no-changes

ci-test:
    dotnet test

format:
    dotnet format

initial_create:
    @if [ -d "HelloWorld" ]; then \
        echo "Error: HelloWorld directory exists"; \
        exit 1; \
    fi; \
    if [ -f ".gitignore" ]; then \
        echo "Error: .gitignore file exists"; \
        exit 1; \
    fi; \
    if [ -f "HelloWorld.slnx" ]; then \
        echo "Error: HelloWorld.slnx file exists"; \
        exit 1; \
    fi; \
    dotnet new gitignore
    dotnet new sln --name HelloWorld
    dotnet new webapi --language F# --name HelloWorld
    dotnet sln add HelloWorld
    dotnet format

initial_destroy:
    rm -rf HelloWorld
    rm -rf .gitignore
    rm -rf HelloWorld.slnx

restore:
    dotnet restore

run:
    dotnet run --project HelloWorld
