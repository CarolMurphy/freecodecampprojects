#!/bin/bash
echo -e "\nWelcome to our salon.\n"
PSQL='psql -X --username=freecodecamp --dbname=salon --tuples-only -c'

function MAIN_MENU {
  DISPLAY_SERVICES=$($PSQL "SELECT service_id, name FROM services WHERE service_id > 0")
  echo "$DISPLAY_SERVICES" | while read ONE BAR TWO 
  do
    echo "$ONE) $TWO"
  done
  echo -e "\nPlease enter the id number for the desired service from the list above."
  read SERVICE_ID_SELECTED
  if [[ $SERVICE_ID_SELECTED < 1 ]] || [[ $SERVICE_ID_SELECTED > 3 ]]
  then
    MAIN_MENU "We have no service associated with your entry. Please try again."
  else
    # request phone number
    echo -e "\nPlease enter your phone number:" 
    read CUSTOMER_PHONE
    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
    # check for correct formatting?
    # if phone number not found
    if [[ -z $CUSTOMER_NAME ]]
    then
      echo -e "\nPlease enter your name:"
      read CUSTOMER_NAME
      # insert new customer phone and name into customers
      NEW_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi
    # get time for appointment
    echo -e "\nWhat time would you like to come in:"
    read SERVICE_TIME
    #get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
    #echo $CUSTOMER_ID
    SET_APPOINTMENT=$($PSQL "INSERT INTO appointments(service_id, customer_id, time) VALUES($SERVICE_ID_SELECTED, $CUSTOMER_ID, '$SERVICE_TIME')")
    SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    FORMAT_SERVICE="$(echo $SERVICE | sed 's/^ //')"
    FORMAT_CUSTOMER_NAME="$(echo $CUSTOMER_NAME | sed 's/^ //')"
    echo -e "\nI have put you down for a $FORMAT_SERVICE at $SERVICE_TIME, $FORMAT_CUSTOMER_NAME."
  fi
}
MAIN_MENU