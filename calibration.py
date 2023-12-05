"""
CALIBRATION PT100 / LAKESHORE

POINTS TAKEN:{
PT100: LAKESHORE


//24.7: 21.5
//25.1: 21.645
17.25: 0.7
25.1: 20.7
30.1: 32.0
30.5: 33.3
42.0: 63.0

}
"""
def modelo():
    global lin2, poly
    from sklearn.linear_model import LinearRegression
    lin = LinearRegression()
    
    x = [[17.25],[25.1],[30.1],[30.5],[42.0]]
    y = [[0.7],[20.7],[32.0],[33.3],[63.0]]
    lin.fit(x, y)

    from sklearn.preprocessing import PolynomialFeatures
    
    poly = PolynomialFeatures(degree=2)
    X_poly = poly.fit_transform(x)
    
    poly.fit(X_poly, y)
    lin2 = LinearRegression()
    lin2.fit(X_poly, y)


def predict(x):
    global lin2, poly
    modelo()
    return lin2.predict(poly.fit_transform([[x]]))[0][0]
