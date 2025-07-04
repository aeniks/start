trap_handler() {
  echo "Caught signal: $1"
  case "$1" in
    INT)
      echo "Handling interrupt (Ctrl+C)..."
      # Add your interrupt handling logic here
      ;;
    TERM)
      echo "Handling termination signal..."
      # Add your termination handling logic here
      ;;
    EXIT)
      echo "Exiting script..."
      # Add your exit handling logic here
      ;;
    *)
      echo "Handling unknown signal..."
      # Handle other signals if needed
      ;;
  esac
  exit 1 # Optionally exit with an error code
}

# Trap specific signals and call the handler function
trap "trap_handler INT" INT  # Trap interrupt signal (Ctrl+C)
trap "trap_handler TERM" TERM # Trap termination signal (e.g., kill)
trap "trap_handler EXIT" EXIT # Trap when script exits

# Example script logic
echo "Script started..."

# Simulate some work
for i in {1..10}; do
  echo "Iteration: $i"
  sleep 1
done

echo "Script finished."
