#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -t --no-align -c"

echo -e "\n▼△▼△▼△▼△▼△▼△▼ Next-Day Cyberpunk Salon ▼△▼△▼△▼△▼△▼△▼\n"
echo -e "\nWelcome to the Next-Day Cyberpunk Salon, where you can schedule your haircare thru a terminal interface like the edgerunner you wish you were.\n"

MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1\n"
  fi

  echo "Pick your poison: "

  SERVICE_LIST=$($PSQL "SELECT service_id, name, price FROM services ORDER BY service_id")
  echo "$SERVICE_LIST" | while IFS="|" read SERVICE_ID SERVICE_NAME PRICE
  do 
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  echo -e "\n"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) APPOINTMENT_SETUP ;;
    2) APPOINTMENT_SETUP ;;
    3) APPOINTMENT_SETUP ;;
    4) APPOINTMENT_SETUP ;;
    5) APPOINTMENT_SETUP ;;
    6) EXIT ;;
    *) MAIN_MENU "C'mon berk, that ain't on the list. Try again."
  esac
}

APPOINTMENT_SETUP() {
 
 # get phone
 echo -e "\nAlright, what's a number where we can ping ya?\n"
 read CUSTOMER_PHONE
 CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
 # if customer not in table
 if [[ -z $CUSTOMER_NAME ]]
 then
  # get name
  echo -e "\nYou're not in the list, choomba, what can we call ya?\n"
  read CUSTOMER_NAME
  # insert new customer
  INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')") 
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
 fi
 # get time
 CHOSEN_SERVICE=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
 echo -e "\nWell $CUSTOMER_NAME, what time do you want your $CHOSEN_SERVICE?\n"
 read SERVICE_TIME
 # make appointment
 CREATE_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
 echo -e "\nI have put you down for a $CHOSEN_SERVICE at $SERVICE_TIME, $CUSTOMER_NAME."
 SERVICE_PRICE=$($PSQL "SELECT price FROM services WHERE service_id = '$SERVICE_ID_SELECTED'")
 echo -e "\nDon't forget your scratch, that'll be $SERVICE_PRICE.\n"
}

EXIT() {
  echo -e "\nBe seeing ya.\n"
}

MAIN_MENU