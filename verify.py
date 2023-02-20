import json
import sys
from nsfw_detector import predict

model = predict.load_model('/var/mobilenet_v2_140_224')

outcome = predict.classify(model, sys.argv[1])

json_out = json.dumps(outcome, indent = 4)

f = open(sys.argv[1] + ".json", "w")
f.write(json_out)
f.close()

print(json_out)