<?php

namespace App\Http\Controllers;

use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Exceptions\UpstreamException;
use App\Http\Services\AssetsHttpService;
use Throwable;

class AssetController extends Controller
{
    public function __construct(
       private readonly AssetsHttpService $assetsHttpService
    ) {}

    /**
     * @param Request $request
     * @return JsonResponse
     * @throws UpstreamException
     */
    public function getAssets(Request $request): JsonResponse
    {
        try {
            # If upstream server returns HTTP 4XX|5XX $response will throw an exception
            $response = $this->assetsHttpService->getAssets($request);
            return response()->json(
                json_decode($response->getBody()->getContents()),
                $response->getStatusCode()
            );
        } catch (Throwable $exception) {
            // message, httpClientException, httpServerResponse
            throw new UpstreamException(
                message: 'Assets retrieval failed',
                previous: $exception
            );
        }
    }
}
