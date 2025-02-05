#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Salon Appointment Scheduler ~~~~~\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo "What salon service would you like to book?" 
  echo -e "\n1) cut\n2) color\n3) perm\n4) style\n5) trim\n6) Exit"
  read SERVICE_ID_SELECTED
  SERVICE_NAME_SELECTED=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED" | sed 's/^ //')


  case $SERVICE_ID_SELECTED in
    1) BOOKING_MENU ;;
    2) BOOKING_MENU ;;
    3) BOOKING_MENU ;;
    4) BOOKING_MENU ;;
    5) BOOKING_MENU ;;
    6) EXIT ;;
    *) MAIN_MENU "Please enter a valid option." ;;
  esac

}

BOOKING_MENU() {
# get customer info
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")

# if customer doesn't exist
if [[ -z $CUSTOMER_NAME ]]
then
# get new customer name
echo -e "\nWhat's your name?"
read CUSTOMER_NAME

# insert new customer
INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
fi

# get customer_id
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

# get appointment time
echo -e "\nWhat time would you like to book?"
read SERVICE_TIME

# create appointment
CREATE_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

# send to main menu
echo -e "\nI have put you down for a $SERVICE_NAME_SELECTED at $SERVICE_TIME, $CUSTOMER_NAME."
EXIT
}

EXIT() {
  echo -e "\nThank you for stopping in.\n"
}

MAIN_MENU
