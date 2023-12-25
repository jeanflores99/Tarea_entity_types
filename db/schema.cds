namespace com.logali;

type Name               : String(50);

type EmailsAddresses_01 : many {
    kind  : String;
    email : String;
}

type EmailsAddresses_02 : {
    kind  : String;
    email : String;
}

type Gender             : String enum {
    male;
    female;
}


entity order {
    clientGender : Gender;
    status       : Integer enum {
        submitted = 1;
        fulfiller = 2;
        shipped   = 3;
        cancel    = -1;
    };
    Priority     : String @assert.range enum {
        high;
        medium;
        low;
    }
}

type Address            : {
    Street     : String;
    City       : String;
    State      : String(2);
    PostalCode : String(5);
    Country    : String(3);
}

entity Emails {
    email_01 :      EmailsAddresses_01;
    email_02 : many EmailsAddresses_02;
    email_03 : {
        kind  : String;
        email : String;

    }
}

entity Car {
    key ID                 : UUID;
        name               : String;
        virtual discount_1 : Decimal;
        virtual discount_2 : Decimal;
}

entity Products {
    key ID               : UUID;
        Name             : String not null;
        Description      : String;
        ImageUrl         : String;
        ReleaseDate      : DateTime default $now;
        DiscontinuedDate : DateTime;
        Price            : Decimal(16, 2);
        // Height           : Decimal(16, 2);
        Height           : type of Price;
        Width            : Decimal(16, 2);
        Depth            : Decimal(16, 2);
        Quantity         : Decimal(16, 2);
}

entity Suppliers {
    ID      : UUID;
    // Name    : String;
    Name    : Products:Name;
    // Street     : String;
    // City       : String;
    // State      : String(2);
    // PostalCode : String(5);
    // Country    : String(3);
    Address : Address;
    Email   : String;
    Phone   : String;
    Fax     : String;
}

entity Categories {
    key ID   : String(1);
        Name : String;
}

entity StockAvailability {
    key ID          : Integer;
        Description : String;
}

entity Currencies {
    key ID          : String(3);
        Description : String;
}

entity UnitOfMeasures {
    key ID          : String(2);
        Description : String;
}

entity DimensionUnits {
    key ID          : String(2);
        Description : String;
}

entity Months {
    key ID               : String(2);
        Description      : String;
        ShortDescription : String(3);
}

entity ProductReview {
    key Name    : String;
        Rating  : Integer;
        Comment : String;
}

entity SalesData {
    key ID           : UUID;
        DeliveryDate : DateTime;
        Revenue      : Decimal(16, 2);
}
