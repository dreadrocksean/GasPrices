using System;  
using System.Collections.Generic;
using System.Net.Http;
  
namespace TestClient {  
    class Program {  
        static HttpClient client = new HttpClient();  
		static int dist = 3;
		static string type = "reg";
		static string sort = "price";
		static string API_KEY = "rfej9napna";
		
        static void Main(string[] args) {  
            client.BaseAddress = new Uri("http://localhost:8080");
            
            GasFeed gasFeed = new GasFeed("66219");
            stations = gasFeed.GetStations;
        }
        
        class GasFeed {
        	private string zip;
            private string[] stations;
        	
        	public GasFeed(string _zip) {
        		zip = _zip;
        	}

            public GetStations() {
                return stations;
            }

            class Station {
                private Dictionary<string, string> props;

                public Station(json) {
                    props = JsonConvert.DeserializeObject<Dictionary<string, string>>(json);
                }
            }
            
            static string GetStationsUrl(double lat, double lng) {
            	return "http://devapi.mygasfeed.com//stations/radius/" +
    				lat + "/" + lng + "/" + dist + "/" + type + "/" + sort + "/" + API_KEY +
    				".json";
            }

            static string getGeoUrl(string zip) {
                return 'http://maps.googleapis.com/maps/api/geocode/json?address=' + zip;
            }
            
            static void ListGasPrices() {  
                //Call HttpClient.GetAsync to send a GET request to the appropriate URI   
                HttpResponseMessage resp = client.GetAsync(getGeoUrl()).Result;  
                resp.EnsureSuccessStatusCode();
                var location = resp.Content.ReadAsAsync<IEnumerable<SelfHost1.location>>().Result;  
                resp = client.GetAsync(GetStationsUrl()).Result;
                var stations = resp.Content.ReadAsAsync<IEnumerable<SelfHost1.stations>>().Result; 
                foreach (var station in stations) {  
                    Console.WriteLine("{0} {1} {2} ({3})", station.name, station.price, station.street, station.city);  
                }  
            }
        }
    }  
}