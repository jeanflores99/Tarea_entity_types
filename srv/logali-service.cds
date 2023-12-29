using {com.logali as entitys} from '../db/schema';

service LogaliService {
    entity Product           as projection on entitys.Products;
    entity Supplier          as projection on entitys.Suppliers;
    entity Category          as projection on entitys.Categories;
    // entity StockAvailability as projection on entitys.StockAvailability;
    // entity Currency          as projection on entitys.Currencies;
     entity UnitOfMeasure     as projection on entitys.UnitOfMeasures;
    // entity DimensionUnit     as projection on entitys.DimensionUnits;
    // entity Month             as projection on entitys.Months;
    // entity ProductReview     as projection on entitys.ProductReview;
    // entity SalesData         as projection on entitys.SalesData;
    // entity TestProduct       as projection on entitys.SelfProducts;
    // entity TestProduct3      as projection on entitys.SelfProducts3;

}
