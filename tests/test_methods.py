import pytest
import pandas as pd
import numpy as np
from pym4metalearning import m4meta_train, make_prediction


def test_m4meta_train():
    m4meta_train("/dev/null")

def test_make_prediction():
    N = 100
    horizon = 10
    ts_to_test = pd.Series(np.arange(N), index=pd.date_range(start="2001-01-01", freq="D", periods=N))
    prediction = make_prediction(ts_to_test, "./tests/data/meta_model.Rdata", h=horizon)
    assert (len(prediction) == horizon)

def test_m4meta_train_sample():
    m4meta_train("/dev/null", sample_size=3)