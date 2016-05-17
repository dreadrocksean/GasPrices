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

            public RetrieveStations(zip, callback) {
                return $http.get(getGeoUrl(zip)).success(function(data) {
                    var lat = data.results[0].geometry.location.lat;
                    var lng = data.results[0].geometry.location.lng;
                    return $http.get(GetStationsUrl(lat, lng)).success(function(data) {
                        angular.forEach(data.stations, function(station) {
                            stations.push(station);
                        });
                        if (callback) {callback();}
                    });
                });



                var resp = client.GetAsync(string.Format("api/books/{0}", id)).Result;  
                resp.EnsureSuccessStatusCode();k
                var data = resp.Content.ReadAsAsync<IEnumerable<SelfHost1.book>>().Result;
                string lat = data.results[0].geometry.location.lat;
                string lng = data.results[0].geometry.location.lng;

                var resp = client.GetAsync(GetStationsUrl(lat, lng)).Result;  
                resp.EnsureSuccessStatusCode();    
                //This method is an extension method, defined in System.Net.Http.HttpContentExtensions    
                var books = resp.Content.ReadAsAsync<IEnumerable<SelfHost1.book>>().Result;  
                foreach (var book in books) {  
                    Console.WriteLine(book.Name);  
                }  
            };
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
        };
        
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