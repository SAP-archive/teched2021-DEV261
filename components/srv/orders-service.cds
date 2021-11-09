using {sap.capire.orders as ord} from '../db/schema';
using {sap.common as cur} from '../db/schema';

@requires : 'authenticated-user'
service OrdersService {

  entity Orders @(restrict : [{
    grant : ['READ'],
    to    : ['User']
  }]) as projection on ord.Orders

  entity Currencies @(restrict : [{
    grant : ['READ'],
    to    : ['User']
  }]) as projection on cur.Currencies

}

service ExternalService {
  action submitorder(orderNo : Integer);
}

annotate Orders with @odata.draft.enabled;
