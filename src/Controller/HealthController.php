<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;

class HealthController extends AbstractController
{
    #[Route('/health', name: 'health_check', methods: ['GET'])]
    public function check(): JsonResponse
    {
        return $this->json([
            'status' => 'healthy',
            'timestamp' => date('c'),
            'service' => 'symfony-devops-challenge',
            'version' => '1.0.0',
            'environment' => $_ENV['APP_ENV'] ?? 'unknown'
        ], 200);
    }

    #[Route('/health/ready', name: 'readiness_check', methods: ['GET'])]
    public function ready(): JsonResponse
    {
        $checks = [
            'database' => $this->checkDatabase(),
            'filesystem' => is_writable(sys_get_temp_dir()),
        ];

        $allHealthy = !in_array(false, $checks, true);
        $statusCode = $allHealthy ? 200 : 503;

        return $this->json([
            'status' => $allHealthy ? 'ready' : 'not_ready',
            'checks' => $checks,
            'timestamp' => date('c')
        ], $statusCode);
    }

    private function checkDatabase(): bool
    {
        // Placeholder - implement actual DB check if using database
        return true;
    }
}