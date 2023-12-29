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
        // Supplier_Id       : UUID;
        // ToSupplier        : Association to one Suppliers
        //                         on ToSupplier.ID = Supplier_Id;
        // UnitOfMeasures_Id : String(2);
        // toUnitOfMeasures  : Association to one UnitOfMeasures
        //                         on toUnitOfMeasures.ID = UnitOfMeasures_Id;
        Supplier         : Association to one Suppliers;
        UnitOfMeasure    : Association to one UnitOfMeasures;
}

entity Suppliers {
    key ID      : UUID;
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
    key ID           : UUID;
        ToProduct_Id : String;
        CreatedAt    : DateTime;
        Name         : String;
        Rating       : Integer;
        Comment      : String;
}

entity SalesData {
    key ID           : UUID;
        DeliveryDate : DateTime;
        Revenue      : Decimal(16, 2);
}

// Select
entity SelfProducts  as select from Products;

entity SelfProducts1 as
    select from Products {
        *
    };

entity SelfProducts2 as
    select from Products {
        Name,
        Price,
        Quantity
    };

entity SelfProducts3 as
    select from Products
    left join ProductReview
        on Products.Name = ProductReview.Name
    {
        Rating,
        Products.Name,
        sum(
            Products.Price
        ) as TotalPrice
    }
    group by
        Rating,
        Products.Name
    order by
        Rating;


// projection

entity ProjProducts  as projection on Products;

entity ProjProducts2 as
    projection on Products {
        *
    };


entity ProjProducts3 as
    projection on Products {
        ReleaseDate,
        Name
    };


// //entitades con parametro
// entity ParamProducts(pName : String)     as
//     select from Products {
//         Name,
//         Price,
//         Quantity
//     }
//     where
//         Name = :pName;

// entity ProjParamProducts(pName : String) as projection on Products
//                                             where
//                                                 Name = :pName;

//Ampliacion
extend Products with {
    PriceCondition     : String(2);
    PriceDetermination : String(3);

};
