# Apex Callouts – Superbadge

Este projeto foi desenvolvido como parte da **Superbadge Apex Callouts Specialist** do Trailhead, plataforma oficial de aprendizado da Salesforce. O desafio simula um cenário realista de integrações REST e SOAP para automatizar processos internos de bem-estar e acessibilidade na empresa fictícia *Alignment Accounting*.

## 📘 Contexto

A empresa promove o bem-estar dos colaboradores por meio do app **Balanced Living**, incentivando a participação em atividades saudáveis. O projeto envolve:

- Recompensar automaticamente funcionários com base na participação recorrente.
- Realizar o faturamento de serviços de acessibilidade para workshops com intérpretes de ASL.

## 📌 Requisitos do Negócio

### 1. Gestão de Recompensas (REST API)

- Identificar usuários que completaram **12 ou mais** atividades no trimestre.
- Enviar dados dos usuários elegíveis para uma API externa (via HTTP POST).
- Garantir segurança com uso de **Named Credential**.
- Implementar e testar com mock de callout.

### 2. Faturamento de Acessibilidade (SOAP API)

- Criar registro de projeto de acessibilidade ao marcar workshops como acessíveis.
- Realizar chamada SOAP para a seguradora com credenciais seguras.
- Simular o envio de dados via proxy gerado por **WSDL**.
- Validar chamadas e respostas com classe mock.

## 🛠️ Componentes Desenvolvidos

### Apex Classes

- `WellnessJourneyRewardsBatch`: Classe batch que identifica usuários elegíveis e executa callout REST.
- `RewardsCalloutService`: Realiza a chamada HTTP com JSON serializado.
- `AccessibilityProjectBilling`: Envia dados de faturamento por SOAP para seguradora.
- `BillingServiceProxy`: Classe gerada via WSDL para chamada SOAP.

### Test Classes

- `RewardsCalloutServiceTest`: Testes para callout REST com sucesso e falha.
- `BillingCalloutServiceTest`: Testes da integração SOAP usando mock service.
- `WellnessJourneyRewardsBatchTest`: Validação da lógica de elegibilidade e envio.
- `RewardsCalloutServiceMock` e `BillingCalloutServiceMock`: Simulam respostas externas.

## ✅ Cobertura de Testes

- Cobertura de código superior a **90%**.
- Simulações abrangentes para cenários de sucesso, falha e dados inválidos.
- Validação de formatação de JSON e tratamento de respostas.

## 🔐 Segurança

- Utilização de **Named Credentials** e **External Credentials**.
- Nenhuma informação sensível hardcoded.
- Simulação segura com classes mockadas.

## 📎 Observações

- Projeto executado no ambiente **Salesforce Developer Edition**.
- SOAP Proxy gerado manualmente via importação do WSDL.
- Testado com registros de atividades trimestrais simuladas.

## 🌐 Referência

[Superbadge - Apex Callouts Specialist (Trailhead)](https://trailhead.salesforce.com/pt-BR/content/learn/superbadges/superbadge-apex-callouts-sbu)

---

## 🧑‍💻 Autor

**Nedson Vieira do Nascimento**  
Salesforce Developer | Trailhead Ranger  
[LinkedIn](https://www.linkedin.com/in/nedson-vieira/) | [Trailblazer.me](https://www.salesforce.com/trailblazer/qnc912aeuektcnhbvp)
