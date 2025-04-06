import datetime

# Define a list to store feedback entries
feedback_list = []

def submit_feedback():
    # Collect user input
    name = input("Enter your name: ")
    category = input("Enter the feedback category (e.g., Infrastructure, Healthcare, Education): ")
    feedback = input("Enter your feedback: ")
    
    # Record the date and time
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    
    # Create a feedback dictionary
    feedback_entry = {
        "name": name,
        "category": category,
        "feedback": feedback,
        "timestamp": timestamp
    }
    
    # Add the feedback entry to the list
    feedback_list.append(feedback_entry)
    print("Thank you for your feedback!\n")

def view_feedback():
    # Check if there is any feedback
    if not feedback_list:
        print("No feedback available.\n")
        return
    
    # Display all feedback entries
    print("Village Feedback Entries:\n")
    for entry in feedback_list:
        print(f"Name: {entry['name']}")
        print(f"Category: {entry['category']}")
        print(f"Feedback: {entry['feedback']}")
        print(f"Date: {entry['timestamp']}\n")
        print("-" * 50)

def main():
    while True:
        # Display menu options
        print("Village Feedback System")
        print("1. Submit Feedback")
        print("2. View Feedback")
        print("3. Exit")
        
        # Get user's choice
        choice = input("Please enter your choice (1-3): ")
        
        if choice == '1':
            submit_feedback()
        elif choice == '2':
            view_feedback()
        elif choice == '3':
            print("Exiting the feedback system. Goodbye!")
            break
        else:
            print("Invalid choice, please try again.\n")

if _name_ == "_main_":
    main()